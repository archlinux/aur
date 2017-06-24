# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: fauno <fauno@kiwwwi.com.ar>
# Contributor: SanskritFritz

pkgname=transmission-remote-cli-git
_gitname=${pkgname%-git}
pkgver=1.7.1.3.g1e412a2
pkgrel=1
pkgdesc="Curses interface for the daemon of the BitTorrent client Transmission"
arch=('any')
url="https://github.com/fagga/transmission-remote-cli"
license=('GPL3')
depends=('python2')
makedepends=('git')
conflicts=('transmission-remote-cli')
replaces=('transmission-remote-cli')
optdepends=('python2-geoip: Guess which country peers come from'
            'adns-python: Resolve IPs to host names') 
source=("git+https://github.com/fagga/transmission-remote-cli.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git --no-pager describe --tags | sed -e 's:-:.:g' -e '1s:v::'
}

package() {
  cd "$_gitname"
  
  install -D -m755 "transmission-remote-cli" "${pkgdir}/usr/bin/transmission-remote-cli"
  install -D -m644 "transmission-remote-cli.1" "${pkgdir}/usr/share/man/man1/transmission-remote-cli.1"
  install -D -m644 "completion/bash/transmission-remote-cli-bash-completion.sh" "${pkgdir}/etc/bash_completion.d/transmission-remote-cli-bash-completion.sh"
  install -D -m644 "completion/zsh/_transmission-remote-cli" "${pkgdir}/usr/share/zsh/site-functions/_transmission-remote-cli"
}
