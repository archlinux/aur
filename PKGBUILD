# Maintainer: Your Name <yatharth3194@gmail.com>
pkgname=bing_points-git
pkgver=1.0.r0.gabcdef0
pkgrel=1
pkgdesc="A tool to collect Bing Rewards points"
arch=('any')
url="https://github.com/Venom120/Bing-Points"
license=('MIT')
depends=('python' 'python-selenium' 'python-webdriver-manager') # Add all Python deps from req.txt
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Bing-Points"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g' || echo "1.0.r0.g$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Bing-Points"

  # Install the desktop entry
  install -Dm644 bing_points.desktop "$pkgdir/usr/share/applications/bing_points.desktop"

  # Install the rest of the project files to /usr/share/bing_points
  install -d "$pkgdir/usr/share/bing_points"
  cp -r ./* "$pkgdir/usr/share/bing_points/"
  rm "$pkgdir/usr/share/bing_points/bing_points.desktop"
}