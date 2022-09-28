# Maintainer: XDwanj <xdwanj@qq.com>
pkgname=jetbrains-rider-pj
pkgver=2021.1.5
pkgrel=1
pkgdesc="A cross-platform .NET IDE by JetBrains."
_buildver=211.7628.61
arch=('x86_64')
url="https://www.jetbrains.com/rider/"
license=('custom')
options=(!strip)

source=("https://download.jetbrains.com/rider/JetBrains.Rider-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/XDwanj/$pkgname/main/$pkgname.desktop")
#source=("JetBrains.Rider-$pkgver.tar.gz"
#        "$pkgname.desktop")
md5sums=('7cc8dfbe9ac9f95b85ffbaed237425fa'
         '4250b97e78f088f61dd979f678638438')


package() {
  backup=("opt/${pkgname}/bin/rider64.vmoptions"
          "opt/${pkgname}/bin/idea.properties")

  cd "$srcdir"
  
  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv "JetBrains Rider-$pkgver"/* "$pkgdir"/opt/$pkgname
  
  chmod 755 -R "$pkgdir"/opt/$pkgname
  
  ln -s /opt/$pkgname/bin/rider.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -D -m644 "$pkgdir"/opt/$pkgname/bin/rider.svg "$pkgdir"/usr/share/pixmaps/"$pkgname".svg
}
