# Maintainer: Prithvi Yewale <yewaleprithvi2002@outlook.com>
# Maintainer: Tanmay Muley <tanmaymuley009@gmail.com>
pkgname='mkgit'
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool for generating GitHub repositories and corresponding local repositories."
arch=('x86_64')
url="https://github.com/cosmicwanderer7/mkgit"
license=('MIT')
depends=()
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b16886c85149d79c7359913be53129bf75223a7847d9f72c6937ad3b89c2d40')


package() {
  cd "$pkgname-$pkgver"   
# Install mkgit executable and other files
  install -Dm755 -t "$pkgdir/usr/share/$pkgname/" ../mkgit-1.1.0/mkgit.bash 
  
  echo "#!/bin/sh 
  /usr/share/mkgit/mkgit.bash \"\$@\"" >> ./mkgit
   
  install -Dm755 ./mkgit "$pkgdir"/usr/bin/mkgit
# Install handlers and utils directories
  cp -r ../mkgit-1.1.0/handlers ../mkgit-1.1.0/utils ../mkgit-1.1.0/LICENSE "$pkgdir"/usr/share/$pkgname

# Optionally, include README file in package
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
