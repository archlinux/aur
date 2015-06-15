pkgname=yozo-office
_pkgver=6.1.0418.131ZH.CL01
pkgver=2013.$_pkgver
pkgrel=2
pkgdesc="Yozo Office - An M$ Office Compatible Office Suit"
url="http://www.yozosoft.com/person/"
depends=('libxtst' 'libxt')
optdepends=('ttf-ms-fonts: Arial, Times, Courier etc. fonts.'
			'ttf-ms-fonts-zh_cn: SimSun, SimHei, ,MSYH, Tahoma etc. fonts')
options=('!strip')
license=("unknown")
source=("http://download.yozosoft.com/free/zh/2013/Yozo_Office_${_pkgver}.deb")
arch=('i686' 'x86_64') 
install=yozo-office.install
md5sums=(5422a094fa5f7f05707073516917d1a6)

[[ $CARCH == 'x86_64' ]] && {
#depends=('lib32-libxext')
source=("http://download.yozosoft.com/free/zh/2013/64/Yozo_Office_${_pkgver}.deb")
md5sums=(4b13b4d33a20fb30afb904d6bcd91497)
}
package() {
cd "$srcdir"
tar zxf data.tar.gz
mv usr etc "$pkgdir"

tar zxf control.tar.gz

cd "$startdir"
cat /dev/null > $install
echo "pre_install() {" >> $install
tail -n+2 "$srcdir"/preinst >> $install
echo "}" >> $install

echo "pre_remove() {" >> $install
tail -n+2 "$srcdir"/prerm >> $install
echo "}" >> $install

echo "pre_upgrade() {" >> $install
echo "pre_remove" >> $install
echo "}" >> $install

echo "post_upgrade() {" >> $install
echo "post_install" >> $install
echo "}" >> $install

echo "post_install() {" >> $install
tail -n+2 "$srcdir"/postinst >> $install
echo "}" >> $install

}
