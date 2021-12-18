# Maintainer: Ruijie Yu <first.last@outlook>

pkgname=emacs-named-daemon
pkgver=1.0.0
pkgrel=1
pkgdesc='Emacs server with named server session'
url=https://gnu.org/software/emacs/emacs.html
arch=(any)
license=(MIT)
depends=(emacs)
source=(@.sed)
b2sums=('e0a1dd069fe35fc16a6a2aa5712a9ebb95b4822d4836504d7cd827d7c0876c2e8e6c407dd666725593565ce30cb0f20aaa45c5cb9dd1def62cd693fbd47c1e52')

build() {
    cd "$srcdir"
    sed -f @.sed \
	/usr/lib/systemd/user/emacs.service \
	> emacs@.service
}

package() {
    cd "$srcdir"
    install -Dvm0644 \
	    emacs@.service \
	    -t "$pkgdir"/usr/lib/systemd/user/
    # mask emacs@server because the default server name is "server".
    ln -sv /dev/null \
       "$pkgdir"/usr/lib/systemd/user/emacs@server.service
}
