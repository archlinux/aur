# Archtrack maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Thanx <thanxm@gmail.com>
pkgname=exploit-db-git
_gitname="exploit-database"
pkgver="git"
pkgrel=1
pkgdesc="The Exploit Database (EDB) an ultimate archive of exploits and vulnerable software - A collection of hacks"
url="https://github.com/offensive-security/exploit-database"
license=("custom")
arch=('any')
depends=('bash' 'wget' 'grep' 'sed' 'tar')
options=('!strip')
source=("git+https://github.com/offensive-security/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${_gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}


package() {
	# The database
	chmod -R 644 "$srcdir/${_gitname}"
	chmod -R a+X "$srcdir/${_gitname}"
	install -dm 755 "$pkgdir/usr/share"
	cp -dr --no-preserve=ownership "$srcdir/${_gitname}" "$pkgdir/usr/share/exploit-db"
    ln -s "/usr/share/exploit-db" "${pkgdir}/usr/share/exploitdb"
}



