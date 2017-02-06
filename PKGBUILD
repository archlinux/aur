pkgname=larryshell
pkgver='1.3.1'
pkgrel='2'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("http://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('ef809a870df8789555a0fdaf6d5c22f0')

package() {
    cd $srcdir/larryshell

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/larryshell
    mkdir -p $pkgdir/usr/share/larryshell

    cp larryshell $pkgdir/usr/bin/
    cp larryshellrc $pkgdir/etc/larryshell/
    cp larryshell-errors.txt $pkgdir/usr/share/larryshell/
    cp larryascii $pkgdir/usr/share/larryshell/
    cp larry.cow $pkgdir/usr/share/larryshell/

    if [ -f /etc/shells ] && [ -z `grep /etc/shells /usr/bin/larryshell` ]
    then
        if [ -z `grep /etc/shells /bin/sh` ]
        then
            sed -i'' -e 's/\(\/bin\/sh\)/\1\n\/usr\/bin\/larryshell/' /etc/shells
        else
            echo "/usr/bin/larryshell" >> /etc/shells
        fi
    fi
}
