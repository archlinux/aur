# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: hacker1024 <joshleivenzon at outlook dot com>

pkgname=mint-themes-git
pkgver=2.1.6.r1.gb1dfbc54
pkgrel=2
pkgdesc="Linux Mint themes"
arch=(any)
url="https://github.com/linuxmint/mint-themes"
license=(GPL3)
makedepends=(git python python-libsass) #sassc pysass
conflicts=(mint-themes mint-x-theme mint-y-theme)
provides=(mint-themes mint-x-theme mint-y-theme)
options=(!strip)
source=("git+https://github.com/linuxmint/mint-themes.git")
sha256sums=('SKIP')

pkgver() {
  cd "mint-themes"
  git describe --long --tags --exclude master* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mint-themes"
  make
  find "${srcdir}/mint-themes"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}

package() {
  cp -aR --no-preserve=ownership "${srcdir}/mint-themes"/usr "${pkgdir}"
}
