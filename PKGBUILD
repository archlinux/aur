# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.24.6
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
sha512sums_x86_64=('f9ce480e74d9e51e65e7379909e38f77b08edb83b58ad615c20e6dc933442d7bfac95ae9be79f7e6593173d67e355247d32e733541789f270cfd2e9df235d1d3')
sha512sums_aarch64=('cfd9689f260415d8d84ce4cedb18cc9f586909f59e912cfc3c80f9076b3e232857abce744ef095d1804c9052ab18e4a4f12393a298928b2b8ce4d7389b662ab8')
sha512sums_armel=('44aa1dfb16650b7ca5288adfe497305ee83f19ece5e170e62a3f5132a4777873a62b368972aca9c7d0f700d6d48e8dd9e6e6e35a644f9e31cf89488c01f8d42e')
sha512sums_armv7h=('9c98618134b86e192fa2d3626056aa463b3775dba5146dfddd43af688b9cc0991bab319b72fb486560dfadfe4ce62dab3f4b94c2fb2988961d9b997283a929c8')

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
