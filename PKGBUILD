# Maintainer: Jan Trejbal <jan.trejbal@gmail.com>
pkgname=gnome-shell-extension-docker-integration-git
pkgver=20160321
pkgrel=4
pkgdesc="Base Docker&Docker compose integration (start, stop, log, up), hide Docker network (veth*)"
arch=('any')
url="https://github.com/Trejjam/Gnome-Docker-integration"
license=('GPL3')
depends=('gnome-shell>=3.18' 'networkmanager')
makedepends=('git')
provides=("docker-integration-applet")
#install=gschemas.install

_gitroot="git://github.com/Trejjam/Gnome-Docker-integration.git"
_gitname="gnome-docker-integration"

build() {
    cd ${srcdir}/
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
	cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done."
}

package() {
    cd "$srcdir/gnome-docker-integration"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "src" "$pkgdir/usr/share/gnome-shell/extensions/docker-integration@jan.trejbal.gmail.com"
}
