# Maintainer: Alexandre M <me@itsalex.fr>
# Contributor: Jimi M <jmaiquez@student.42.fr>
pkgname=serve
pkgver=0.1
pkgrel=1
pkgdesc="Serve static files by one simple command"
arch=(any)
url="https://github.com/ItsJimi/serve"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
makedepends=('go' 'git')
_gitroot="git://github.com/ItsJimi/serve"
_gitname="serve"

 
build() {
    msg "Récupération des sources sur le serveur git"
    if [[ -d $_gitname ]] ; then
        cd $_gitname && git pull origin && cd .. || return 1 
        msg "Les fichiers locaux ont été mis à jour."
    else
        git clone $_gitroot || return 1
        msg "Les fichiers ont été téléchargés."
    fi
    cd $_gitname

    go get golang.org/x/net/http2
    go build
}


package() {
  cd "$srcdir/$pkgname"

  cp serve $pkgdir
}
