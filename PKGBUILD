# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: éclairevoyant
# Contributor: Daniel Mario <github.com/limadm>
# Contributor: Fredrick Brennan <copypaste at kittens dot ph>

pkgname=bdf2psf
pkgver=1.249
pkgrel=1
epoch=1
pkgdesc='Debian utility to convert BDF font files to PSF format'
arch=('any')
url="https://packages.debian.org/unstable/${pkgname}"
depends=(perl)
license=(GPL-2.0-or-later)
source=(
  "https://deb.debian.org/debian/pool/main/c/console-setup/${pkgname}_${pkgver}_all.deb"
  "0001-print-help-when-no-args-provided.patch"
)
sha256sums=('eea7e9f60abeee4960713b844f0d97153dc0595e5b48d327ae7ce2a8bf24d8f1'
            'e371f17d506ff0047818489f6e8af191d6c296bcdaf8b34217ea8cfeeaff9785')

prepare() {
  tar -xvf data.tar.xz "./usr/bin/${pkgname}"
  patch -Np1 -i 0001-print-help-when-no-args-provided.patch
}

package() {
  tar -xvf data.tar.xz -C "${pkgdir}" --exclude './usr/bin'
  install -Dm755 usr/bin/${pkgname} -t "${pkgdir}/usr/bin/"
}
