# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('passky-desktop-git')
pkgver=8.1.1.r1.geac8356
pkgrel=2
pkgdesc="Desktop Application for Passky Password Manager"
arch=('any')
url="https://github.com/Rabbit-Company/Passky-Desktop"
license=('GPL3')
makedepends=('git' 'yarn')
provides=('passky-desktop')
conflicts=('passky-desktop')
source=("git+https://github.com/Rabbit-Company/Passky-Desktop.git" "git+https://github.com/0xGingi/passky-desktop-aur")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd Passky-Desktop
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd Passky-Desktop
	yarn install
	yarn build --dir
}

package() { 
           cd Passky-Desktop
           install -d ${pkgdir}/opt/Passky
           cp -r dist/linux-unpacked/* ${pkgdir}/opt/Passky
           cd ..
           cd passky-desktop-aur
           install -Dm644 "usr/share/icons/hicolor/512x512/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/passky.png"
	   install -Dm644 "usr/share/icons/hicolor/256x256/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/passky.png"
	   install -Dm644 "usr/share/icons/hicolor/128x128/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/passky.png"
	   install -Dm644 "usr/share/icons/hicolor/64x64/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/passky.png"
	   install -Dm644 "usr/share/icons/hicolor/48x48/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/passky.png"
           install -Dm644 "usr/share/icons/hicolor/32x32/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/passky.png"
	   install -Dm644 "usr/share/icons/hicolor/16x16/apps/passky.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/passky.png"
	   install -Dm644 "usr/share/doc/passky/changelog.gz" "${pkgdir}/usr/share/doc/passky/changelog.gz"
	   install -Dm755 "usr/share/applications/passky.desktop" "${pkgdir}/usr/share/applications/passky.desktop"


}
