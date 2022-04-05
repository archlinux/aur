# Maintainer: Aleksandr <contact via dot aur>

_pkgname=activemq
pkgname=activemq-runit
pkgver=1.4
pkgrel=1
pkgdesc="runit service scripts for activemq"
arch=('any')
url="https://github.com/artix-linux"
license=('GPL-3')
groups=('runit-system')
depends=('activemq')
provides=('activemq-runscripts' 'init-activemq')
conflicts=('init-activemq')
replaces=('activemq-runscripts')
source=("activemq.run"
        "activemq.conf"
        "runsvdir-activemq")

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/opt/activemq/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv "${_pkgname}"
    install -Dm755 "$srcdir/runsvdir-activemq" "$pkgdir/etc/runit/sv/runsvdir-activemq/run"
    install -Dm644 "$srcdir/activemq.conf" "$pkgdir/opt/activemq/runit/sv/activemq/conf"
    mkdir "$pkgdir/opt/activemq/runit/service"
}

sha256sums=('27720d3df6b10088bf05a7a0708df715e4f137838520622ed446d7cadf964995'
            '2eef8d61c0ff1bce8f9e0db69713be033506c3d888830cc6372d3ea0deae79de'
            '0765185159214caf7d4a676cf34db3ad1f1803956fa5130ea497c76a72e48f69')
