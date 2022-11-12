# Maintainer: badcast <lmecomposer@gmail.com> 
# Contributor: Artem Izmaylov <support@aimp.ru>

pkgname=aimp
pkgver=5.10
pkgrel=2412
url="https://www.aimp.ru/"
pkgdesc="AIMP (on Wine) is powerful free audio player."
arch=('x86_64')
license=('custom')
depends=('wine') 
source=("https://www.aimp.ru/files/linux/aimp_${pkgver}-${pkgrel}_amd64.deb")
md5sums=('c47cb1f7be2f7242fa9c16ecd9abe647')

build(){
   cd "${srcdir}"
   
   echo "Append aimp (shell):/usr/bin/aimp"
   #save patch
   echo "#!/usr/bin/sh
/usr/bin/wine '/opt/aimp/AIMP/AIMP.exe' \"\$@\"" > aimp 
}

package(){
   cd "${srcdir}"
   
   dest="$pkgdir/opt/aimp/"
   
   #extract sources
   bsdtar -xf "data.tar.gz" -C "$pkgdir"
   
   chmod +x "$pkgdir/opt/aimp/aimp.desktop"

   #append Desktop.file
   install -Dm644 $dest/aimp.desktop "$pkgdir/usr/share/applications/aimp.desktop"
   
   install -Dm755 aimp "$pkgdir/usr/bin/aimp"
   
   #patch
   install -Dm7 aimp "$dest/aimp.bash"
}
