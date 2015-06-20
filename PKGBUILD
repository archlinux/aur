#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='python2-cleanup-maildir-git'
_gitname='cleanup-maildir'
_gitroot='git://github.com/jvc/cleanup-maildir.git'
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/jvc/cleanup-maildir'
depends=('python2>=2.7.6')
makedepends=('git')
license=('none')
pkgdesc="Python script to manipulate maildirs."
provides=(cleanup-maildir)
conflicts=(cleanup-maildir)
source=($pkgname::git://github.com/jvc/cleanup-maildir.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d "$_gitname" ] ; then
		cd "$_gitname" && git pull origin master
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"
}

package() {

	# install script
	cd "$srcdir/$_gitname"
    install -D -m644 "$srcdir/$_gitname/cleanup-maildir" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/cleanup-maildir"

}

