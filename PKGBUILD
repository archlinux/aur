# Maintainer: Dmitry Sokol <aquarius24(at)ya(dot)ru>
# Contributor: Dmitry Sokol <aquarius24(at)ya(dot)ru>

pkgname=cgru
pkgver=3.3.0
pkgrel=1
pkgdesc="Free And Open Source CG Tools Pack. Includes Afanasy render farm manager, Rules project tracker and tools around it."
arch=('x86_64')
url="https://cgru.info/"
license=('LGPL')
depends=('openexr' 'libpqxx' 'python2' 'python-pyqt5')
makedepends=('rpmextract' 'patch')
conflicts=()
source=(
	https://sourceforge.net/projects/cgru/files/3.3.0/cgru.3.3.0.CentOS-7_x86_64.tar.gz
	'systemd_services.patch'
)
md5sums=('SKIP' 'SKIP')

package() 
{

  cd "$pkgdir"

  msg2 "Unpacking Red Hat .rpm files. This could take a while..."

  for i in "$srcdir"/*.rpm; do
      msg2 $i
      rpmextract.sh $i
  done
	
  msg2 "Patching systemd services..."
  
  patch --directory="${pkgdir}/usr/lib/systemd/system" --strip=1 --input="${srcdir}/systemd_services.patch"

}

