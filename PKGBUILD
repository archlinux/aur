# Original Contributor: Archie <xMickael@ifrance.com>
# Maintainer : Anish Bhatt <anish[removethis][at]gatech[dot]edu>

pkgname=phatch
pkgver=0.2.7.1
pkgmajorv=0.2.7
pkgrel=7
pkgdesc="Phatch is a simple to use cross-platform GUI Photo Batch Processor."
depends=('python2' 'wxpython' 'python2-pillow' 'mlocate')
optdepends=('python2-nautilus' 'pyexiv2')
arch=('i686' 'x86_64')
license=('GPL')

source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz" )
	
url="http://photobatch.stani.be"
md5sums=('c0638bcc6510d340c03c40ddfb0a0c2f' )
install='phatch.install'

package() {
	pushd ${srcdir}/${pkgname}-${pkgmajorv}
	   pushd ${pkgname}
	      pushd actions
         	sed -i 's|import Image|from PIL import Image|g' *.py
				sed -i 's|from PIL from PIL|from PIL|g' convert_mode.py
      	popd
      	pushd core
         	sed -i 's|import Image|from PIL import Image|g' *.py
      	popd
      	pushd data
      	sed -i 's|import Image|from PIL import Image|g' *.py
      	popd
      	pushd lib
         	sed -i 's|import Image|from PIL import Image|g' *.py
         	sed -i 's|import PngImagePlugin|from PIL import PngImagePlugin|g' *.py
         	pushd pyWx
            	sed -i 's|import Image|from PIL import Image|g' *.py
         	popd
      	popd
	      pushd other
         	sed -i 's|import Image|from PIL import Image|g' *.py
      	popd
      	pushd templates
         	sed -i 's|import Image|from PIL import Image|g' *.py
      	popd
      	sed -i '150a\        import phatch' app.py
   	popd

	   python2 setup.py install --root=${pkgdir}	
}
