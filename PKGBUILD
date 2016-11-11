# Maintainer:  jyantis <yantis@yantis.net>

pkgname=autoenv-git
pkgver=0.2.1.r2.g7eb70ec
pkgrel=1
pkgdesc='Directory based enviroments'
arch=('any')
url='https://github.com/kennethreitz/autoenv'
license=('custom')
source=("$pkgname"::'git+https://github.com/kennethreitz/autoenv.git')
sha256sums=('SKIP')
depends=('bash')
optdepends=('zsh: if you prefer zsh over bash')
install='autoenv.install'
makedepends=('git')
conflicts=('autoenv')

pkgver() {
  cd "$pkgname"
  set -o pipefail
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//' ||

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    printf "%s.r%s.g%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi

}

package() {
  cd "$pkgname"

  install -D -m755 activate.sh "${pkgdir}/usr/share/${pkgname}/activate.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
