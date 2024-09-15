# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Macchina-CLI
_pkgname=macchina
pkgname=${_pkgname}-bin
pkgver=6.2.1
pkgrel=2
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
arch=("x86_64" "aarch64")
license=("MIT")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=("gzip")
optdepends=("wmctrl")
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md"
        "CHANGELOG_${pkgver}::${_urlraw}/CHANGELOG.md"
        "MAN.1_${pkgver}::${_urlraw}/doc/macchina.1"
        "MAN.7_${pkgver}::${_urlraw}/doc/macchina.7")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-${arch[0]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[0]}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-${arch[1]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[1]}.tar.gz")
sha256sums=('d868343456eff199aa8dec4b781175c1cc427a9e4e5b6fbcc707bab9f87aa367'
            'f9af88538a7a74c77ab0da0e8f2ab715a824c0cb07026d9ea30a26c630b0b54f'
            '0499e39ccdd881c00831cce5efe4235b104651ca5d5715a28b94506ac9e3ebca'
            '20f85289d35649741aa10d6da2dd36cc7ccc90babbd2c31ab49a107e2422d9a5'
            '65d6480863e913f0e5fa8fd234bb95765c70e26482951c013e386a7946a6191a')
sha256sums_aarch64=('a2c3d0f7e16b10155bfaff045c376cf4ea2c77c1e1f95145f5ce7a021aa79b2b')
sha256sums_x86_64=('80b7cbc14b0448ec54072cf3d366e373175d59ae7dc3687a3ad8f1eaa0ad6275')


build() {
  cd "$srcdir/"

  gzip -c MAN.1_${pkgver} > ${_pkgname}.1.gz
  gzip -c MAN.7_${pkgver} > ${_pkgname}.7.gz
}

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "${_pkgname}.7.gz" -t "${pkgdir}/usr/share/man/man7"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
