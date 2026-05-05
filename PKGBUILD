# Maintainer: Master Kim <eliakimrosilarts@gmail.com>
pkgname=kira
_pkgname=kira
pkgver=0.1.1
pkgrel=1
pkgdesc="kira: a specialized expert in Arch Linux and Hyprland"
arch=('any')
url="https://github.com/eliakimrosil/kira"
license=('MIT')
depends=('python' 'python-pyaudio' 'python-dotenv' 'python-rich' 'python-distro')
optdepends=('grim: for screenshot support'
            'slurp: for region selection in screenshots'
            'hyprland: for window management integration'
            'mpv: for music playback'
            'bluez-utils: for bluetooth management')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkgname-repo::git+$url.git")
md5sums=('SKIP')

pkgver() {
  printf "0.1.1"
}

build() {
  cd "$_pkgname-repo"
  # Remove any previous build artifacts
  rm -rf dist/ build/ *.egg-info/
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-repo"
  # Only install the specific wheel we just built
  python -m installer --destdir="$pkgdir" dist/kira-*.whl

  # Install the .env.example as a reference
  install -Dm644 .env.example "$pkgdir/usr/share/$pkgname/.env.example"

  # Install the License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
