# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=iconoscope-git
pkgver=0.9.9.r0.ge4dade8
pkgrel=2
pkgdesc="Explore the system's icon theme database written in Vala designed for Pantheon Shell"
arch=(x86_64)
url="https://github.com/santileortiz/Iconoscope"
license=(GPL3)
depends=(gtk3)
makedepends=(git python)
provides=(iconoscope)
conflicts=(iconoscope)
source=("iconoscope::git+${url}.git")
md5sums=('SKIP')

prepare() {
  # Add LDFLAGS
  sed -i.bak "s/-lm/& ${LDFLAGS}/" "${pkgname%-git}/pymk.py"
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  ./pymk.py iconoscope
}

package() {
  cd "${pkgname%-git}"
  ./pymk.py install --install_completions --destdir "${pkgdir}/usr/"
  ln -s /usr/bin/com.github.santileortiz.iconoscope "$pkgdir/usr/bin/iconoscope"
}

