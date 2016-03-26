pkgname=myagent-im-git
pkgver=20130319
pkgrel=3
pkgdesc="Mail.Ru Agent"
arch=('i686' 'x86_64')
url="http://code.google.com/p/myagent-im/"
license=('GPL2')
depends=('zlib' 'xapian-core' 'aspell' 'libxss' 'qtmobility')
makedepends=('gcc' 'flex' 'pkg-config' 'sed' 'git')
source=()

_gitroot=https://github.com/Andrsid/myagent-im.git
_gitname=myagent-im

build()
{
cd ${srcdir}

if [ -d ${_gitname} ] ; then
 msg "Removing old data...."
 rm -Rf ${_gitname}
fi
msg "Connecting to GIT server...."
git clone ${_gitroot}
msg "GIT checkout done or server timeout"

msg "Creating pkg..."
cd ${srcdir}/${_gitname}
sed -e '/isEmpty(PREFIX):PREFIX/ s/\/usr\/local/\/usr/' -i ./src/configure.pri

qmake
make
}

package() {
cd ${srcdir}/${_gitname}
make INSTALL_ROOT="$pkgdir" install
}