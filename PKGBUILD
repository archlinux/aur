# Maintainer: Moksh Malde <maldemoksh437@gmail.com>
pkgname=reconsage-git
pkgver=1.9.0
pkgrel=1
pkgdesc="Advanced passive reconnaissance framework with WAF, rate-limit and fingerprint detection"
arch=('any')
url="https://github.com/moksh-codedeveloper/Recon_sage"
license=('MIT')
depends=(
  'python'
  'python-fastapi'
  'python-httpx'
  'python-rich'
  'python-requests'
  'python-dnspython'
  'python-pydantic'
  'python-uvicorn-loguru-integration-git'  # fixed uvicorn dependency
)
makedepends=('git' 'python-pip')  # git is needed for VCS source
source=("Recon_sage::git+$url.git")  # Give it the correct name
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Recon_sage"  # Added $srcdir and correct directory name
  git describe --long --tags --dirty --always 2>/dev/null \
    | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/Recon_sage"  # Added $srcdir and correct directory name
}

package() {
  cd "$srcdir/Recon_sage"  # Added $srcdir and correct directory name
  install -d "$pkgdir/usr/lib/reconsage"
  cp -r . "$pkgdir/usr/lib/reconsage"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/reconsage/main.py "$pkgdir/usr/bin/reconsage"
}
