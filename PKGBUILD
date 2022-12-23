# Maintainer: badcast <lmecomposer@gmail.com> 
# Contributor: Artem Izmaylov <support@aimp.ru>

pkgname=aimp
pkgver=5.10
pkgrel=2418
url="https://www.aimp.ru/"
pkgdesc="AIMP (on Wine) is powerful free audio player."
arch=('x86_64')
license=('custom')
depends=('wine') 
source=("https://www.aimp.ru/files/linux/aimp_${pkgver}-${pkgrel}_amd64.deb")
md5sums=('342ccb740bad87ee3a1217d0bb83fd12')

build(){
   cd "${srcdir}"
   
   echo "Append aimp (shell):/usr/bin/aimp"
}

package(){
   desktopfile="aimp.desktop"
   runner="aimp"
   dest="$pkgdir/opt/aimp"
   cd "${srcdir}"
   
   #extract sources
   bsdtar -xf "data.tar.gz" -C "${pkgdir}"

   #set a prompt mode +x
   chmod +x "$pkgdir/opt/aimp/${desktopfile}"

   #remove owner
   rm -f "$dest/${desktopfile}"
   rm -f "$dest/${runner}.bash"
   
   #replace owner
   #fix owner bug's 

   #append Desktop.file
   install -Dm644 ../${desktopfile} "$pkgdir/usr/share/applications/${desktopfile}"

   #append /usr/bin/aimp file
   install -Dm755 ../${runner} "$pkgdir/usr/bin/aimp"
}
