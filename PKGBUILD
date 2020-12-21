# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=ocenaudio
pkgname="$_pkgname"
pkgver=3.10.0
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="https://www.ocenaudio.com/"
license=('custom')
depends=('hicolor-icon-theme' 'jack' 'libpulse' 'qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums_i686=('4ba91b33f7b53254b67f310b60e237b82f5946173018673f25a3a38444e29d44')
sha256sums_x86_64=('63949ac0d30c41bb5a5a951543cdb135c26382f68a2a3971fd931ee5ecfc2c34')
source_i686=("${_pkgname}-${pkgver}_i686.deb::https://www.ocenaudio.com/downloads/index.php/ocenaudio_debian32.deb?version=${pkgver}")
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.xz::https://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.xz?version=${pkgver}")

build() {
  echo "ocenaudio "$pkgver
}

package() {
  if [ $CARCH == "i686" ]; then
    tar -xJf ${srcdir}/data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/var"
  else
    cp -rLnf ${srcdir}/* ${pkgdir}/
    rm -f ${pkgdir}/${_pkgname}-${pkgver}_x86_64.tar.xz
  fi
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses"
  install -Dm644 "${pkgdir}/opt/$_pkgname/bin/ocenaudio_license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  ln -sf "/opt/$_pkgname/bin/${_pkgname}" "${pkgdir}/usr/bin"
  sed -i 's|^Exec=/opt/ocenaudio/bin|Exec=/usr/bin|' "$pkgdir/usr/share/applications/ocenaudio.desktop"

  rm -f "${pkgdir}/opt/$_pkgname/bin/ocenaudio_license.txt"
}
