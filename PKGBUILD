# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4

pkgname=mycron-git
_gitname=mycron
pkgver=3.0
pkgrel=2
pkgdesc='A standards compliant and convenient cron service.'

url='https://dev.0x7be.de/mycron.html'
arch=('any')
license=('GPL')

depends=('python>=3.0')
makedepends=('git')

install=mycron.install

branch='master'
source=("git://github.com/dsohler/mycron.git#branch=$branch"
        'mycron.install'
        'mycron.1'
        'mycron.conf.5'
        'mycron.crontab.5'
        'mycron@.service')


sha256sums=('SKIP'
            'ca698f40789a69f29ba16e058ae7232a13012c770294d95303babc1ba8d649ae'
            '06e35678ce416e96f8aca6a9a54bdb89a899a4202d36b5b5580a3c91e03b879a'
            '9f1673a4d60758fab889c9256afc74ba0fc6adc7775c69fedfd093d301b15fa0'
            'db6f060502d86bfe0cbc209da9bc255db4a213a444e98ac54977765b7c19dd9d'
            '6299cd75c07916b5066c164dad59cdd4b1ad8c85fc4b629a8bf3a7587b8d3e02')


pkgver() {
    cd "$srcdir/$_gitname"
    echo $(sed -n "s/^progversion = '\(.*\)'/\1/p" mycron.py)
}

package() {
    cd "$srcdir/$_gitname"
    _DOCPATH="usr/share/doc/mycron"
    _MANPATH="usr/share/man"
    _SYSTEMD="usr/lib/systemd/system"
    install -Dm 755 mycron.py $pkgdir/usr/bin/mycron
    install -Dm 644 crontab.vim $pkgdir/$_DOCPATH/crontab.vim
    install -Dm 644 ../mycron.1 $pkgdir/$_MANPATH/man1/mycron.1
    install -Dm 644 ../mycron.conf.5 $pkgdir/$_MANPATH/man5/mycron.conf.5
    install -Dm 644 ../mycron.crontab.5 $pkgdir/$_MANPATH/man5/mycron.crontab.5
    install -Dm 644 ../mycron@.service $pkgdir/$_SYSTEMD/mycron@.service
    gzip $pkgdir/$_MANPATH/man1/mycron.1
    gzip $pkgdir/$_MANPATH/man5/mycron.conf.5
    gzip $pkgdir/$_MANPATH/man5/mycron.crontab.5
}
