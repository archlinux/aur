# Maintainer: robertfoster
# Contributor: Eschwartz <eschwartz93@gmail.com>

pkgname=winetricks-git
pkgver=20260125.r44.gf3890f67
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='https://wiki.winehq.org/winetricks'
license=('LGPL-2.1-or-later')
arch=('any')
depends=('bash' 'cabextract' 'perl' 'unzip' 'wine')
makedepends=('git')
optdepends=('zenity: GTK GUI'
  'kdialog: KDE GUI (less capable)'
  '7zip: native extraction instead of Windows 7-Zip fallback'
  'unrar: native extraction of RAR archives'
  'aria2: preferred downloader'
  'wget: alternative downloader')
conflicts=('winetricks')
provides=('winetricks')
source=("$pkgname::git+https://github.com/Winetricks/winetricks.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
