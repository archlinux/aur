# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=input-wacom-dkms
_pkgname=input-wacom
pkgver=0.33.0
pkgrel=1
pkgdesc="Latest Kernel modules form Wacom tablets (DKMS). Useful if your wacom tablet is not supported upstream yet."
arch=('i686' 'x86_64')
url="http://linuxwacom.sourceforge.net/wiki/index.php/Input-wacom"
license=('GPL2')
depends=('dkms')
optdepends=('xf86-input-wacom: for actually using a Wacom tablet')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/linuxwacom/xf86-input-wacom/input-wacom/$_pkgname-$pkgver.tar.bz2"
	"dkms.conf"
	"blacklist-input-wacom-dkms.conf")
noextract=()
md5sums=('41f3d925c397920e57f4b1c8eaf217a5'
         '00aebe1d5a4350d26b59d9aa766d2c55'
         'da99119208e69b9a611b1809e1f241f8')
package() {      
 
	installdir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installdir"
        install -m644 "$srcdir/dkms.conf" "$installdir"
        
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-input-wacom-dkms.conf" "$pkgdir/etc/modprobe.d"
       
        cd "${srcdir}/${_pkgname}-${pkgver}/"
       
        for d in `find . -type d`
        do
                install -dm755  "$installdir/$d"
        done
       
        for f in `find . -type f`
        do
                install -m644 "${srcdir}/${_pkgname}-${pkgver}/$f" "$installdir/$f"
        done
        chmod +x "$installdir/configure"
}
