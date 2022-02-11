# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='todelete'
pkgdesc='To delete'
pkgver=1.0.0
pkgrel=1
_commit='df68e747647d8439438d10248262eb894bcdafdd'  # Temporal safety solution
arch=('any') 
url="https://github.com/jnaulty/${pkgname}"
license=('No license')  # Issue on github created, I hope jnaulty will reply
source=( "git+${url}.git#commit=${_commit}" )
sha512sums=( 'SKIP' )

build()
{
    sed -e 's/replace_user/${USER}/' "${pkgname}/insert-yubi.sh.template" > "${pkgname}/insert-yubi.sh"
}

package()
{
    install -D -m644 "${pkgname}/69.yubikey.rules" "${pkgdir}/etc/udev/rules.d/69.yubikey.rules"
    install -D -m744 "${pkgname}/insert-yubi.sh" "${pkgdir}/usr/local/bin/insert-yubi.sh"
}
