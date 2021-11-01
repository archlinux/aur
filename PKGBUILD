# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=spicetify-theme-dribbblish-dynamic
pkgver=3.0.1
pkgrel=1
pkgdesc="A mod of Dribbblish theme for Spicetify with support for light/dark modes and album art based colors."
arch=('any')
url="https://github.com/JulienMaille/dribbblish-dynamic-theme"
license=('custom')
groups=()
depends=(spicetify-cli)
makedepends=(unzip curl git)
checkdepends=()
optdepends=()
provides=(spicetify-theme-dribbblish-dynamic)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("$pkgname::git+https://github.com/JulienMaille/dribbblish-dynamic-theme.git#branch=main")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
  cd "$pkgname"
  git tag | tail -1
}

build() {
  echo "Downloading latest release..."
  curl  "https://github.com/JulienMaille/dribbblish-dynamic-theme/releases/download/${pkgver}/DribbblishDynamic_v${pkgver}.zip" --fail --location --progress-bar -O
  unzip ./DribbblishDynamic_v${pkgver} -d ./DribbblishDynamic
}

package() {
  mkdir -p $pkgdir/usr/share/spicetify-cli/Themes/
  mkdir -p $pkgdir/usr/share/spicetify-cli/Extensions/
	cp -r "$srcdir/DribbblishDynamic" "$pkgdir/usr/share/spicetify-cli/Themes/"
	cp "$srcdir/DribbblishDynamic/dribbblish-dynamic.js" "$pkgdir/usr/share/spicetify-cli/Extensions/"
}
