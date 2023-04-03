# Maintainer: Doclic <doclic@tutanota.com>

pkgname=vtex2-bin
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A VTF conversion and creation tool"
arch=(i686 x86_64 aarch64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(qt6-base wget curl)
provides=(vtex2)
conflicts=(vtex2)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/StrataSource/vtex2/releases/download/v${pkgver}/vtex2.linux-amd64.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	# Try curl or wget, if none are installed, use default
	if command -v curl >/dev/null 2>&1; then
	  curl --silent "https://api.github.com/repos/StrataSource/vtex2/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' | # Get tag line
        sed -E 's/.*"v([^"]+)".*/\1/' # Pluck JSON value
    elif command -v wget >/dev/null 2>&1; then
      wget -qO- "https://api.github.com/repos/StrataSource/vtex2/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' | # Get tag line
        sed -E 's/.*"v([^"]+)".*/\1/' # Pluck JSON value
	else
	  printf $pkgver
    fi
}

package() {
  cd $srcdir
  mkdir -p "${pkgdir}/usr/bin"
  unzip vtex2.linux-amd64.zip -d "${pkgdir}/usr/bin/"
  chmod 755 "${pkgdir}/usr/bin/vtex2"
  chmod 755 "${pkgdir}/usr/bin/vtfview"
}

