# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.23.6
pkgrel=1
pkgdesc='An ultra-lightweight and blazing-fast Messaging broker/bus for IoT edge & SDV'
url='https://nanomq.io'
arch=(x86_64 aarch64 armel armv7h)
license=(MIT)
depends=(gcc-libs)
provides=(nanomq)
conflicts=(nanomq)
makedepends=(libarchive)
backup=(etc/nanomq.conf)
install="${pkgname}.install"
noextract=("${pkgver}-"{x86_64,aarch64,armel,armv7h}".rpm")
source=(nanomq.service)
source_x86_64=("${pkgver}-x86_64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-x86_64.rpm")
source_aarch64=("${pkgver}-aarch64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-arm64.rpm")
source_armel=("${pkgver}-armel.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armel.rpm")
source_armv7h=("${pkgver}-armv7h.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armhf.rpm")
sha512sums=('7b86f32e35697f0f955f3d562637c5e067ac9b6691c7b6957d9106836445ffb75690530d72c5a0613519daaff7459ffbc776b2b3210d2a727053b097c8d950ee')
sha512sums_x86_64=('3d13dde91c62e15f8ef3b5f8d99b4c4e88f491086fe434be0958f0e7f08d31cff3b360cd80c2a5ddec0898848a0c6d628d932c34a52499a5b60314143cad2334')
sha512sums_aarch64=('125e76258696a4e3edb783516dd9d55220c7bb5a62b7bb71a70054e86dfe0c0f441a209e411b5e61268892f57a13ee08fb3646a11c6881e0837bf719764fee9b')
sha512sums_armel=('551ec6b30cfa8077e7aa87351a0fe5310a7efc598c5400e76d3e900b52ea8c18a32772e79ea20b923f5fa330117c0549ab22eae22ec65accfc87027a6dbd8ec3')
sha512sums_armv7h=('a07f672af901c6765cfe8e68980eaedd42885c409d8c09938a918c804da1bad519d9b1971c070b9551cc8efea5cd0935dbc97bef318c236ee88a0fd50728ac21')

prepare() {
  rm -rf "${srcdir}/root"
  mkdir -p "${srcdir}/root"
  bsdtar -xf "${srcdir}/${pkgver}-${CARCH}.rpm" -C "${srcdir}/root"
}

package() {
  cd "${srcdir}/root"

  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/include" \
    "${pkgdir}/usr/lib" \
    "${pkgdir}/usr/lib/systemd/system" \
    "${pkgdir}/usr/share"

  cp -r \
    "usr/local/bin/" \
    "usr/local/include/" \
    "usr/local/lib/" \
    "usr/local/share/" \
    "${pkgdir}/usr/"

  cp usr/local/etc/nanomq.conf "${pkgdir}/etc/nanomq.conf"

  install -Dm 644 "${srcdir}/nanomq.service" -t "${pkgdir}/usr/lib/systemd/system"
}
