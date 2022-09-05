# Maintainer: ZappaBoy <federico.zappone at justanother dot group>
pkgname=traefik-warden-git
pkgbase=traefik-warden-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Warden is a Just Another project that helps to manage services through Traefik."
arch=('any')
url="https://github.com/Just-Another-Organization/traefik-warden"
license=('GNU AFFERO GENERAL PUBLIC LICENSE')
depends=()
makedepends=('git' 'python-pip')
provides=(warden)
source=('git+https://github.com/Just-Another-Organization/traefik-warden')
md5sums=('SKIP')

prepare() {
  python -m pip install yq
}

instructions() {
  /bin/cat << EOF
Remember to add the WARDEN_ROOT="$HOME/.warden/" to your ~/.bashrc:

  echo 'export WARDEN_ROOT="\$HOME/.warden/"' >> \$HOME/.bashrc

EOF
}

package() {
  cd "$srcdir/traefik-warden/"
  chmod +x "./install.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  ./install.sh "$HOME/.warden/"
  instructions
}

# vim:set ts=2 sw=2 et:
