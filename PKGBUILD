# Maintainer: jingluwei <weijinglu at qq dot com>
pkgname=cxstudy-wine
pkgver=1.4.1
pkgrel=1
# https://atomgit.com/JingluWei_chn/cxstudy-wine/tree/master
pkgdesc="a version of repacked wine app of cxstudy(学习通)"
arch=('x86_64')
url=""https://atomgit.com/JingluWei_chn/cxstudy-wine/tree/master
license=('MIT')
depends=('wine>=9.22' 'wine-mono' 'wine-gecko' 'noto-fonts-cjk' 'tar' 'git')
source=(
  'cxstudy-wine::git+https://gitcode.com/JingluWei_chn/cxstudy-wine.git')
sha256sums=('SKIP')
conflict=('cxstudy<=1.4.0')

package() {
  cd "$srcdir"
  #$pkgdir/usr/bin/lib/cxstudy-wine
  mkdir -p "$pkgdir/usr/bin/lib"
  cp -r "$srcdir/cxstudy-wine" "$pkgdir/usr/bin/lib" 
  cd "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0"
  tar -zxvf "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0/cxstudy.tar.gz"
  rm "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0/cxstudy.tar.gz"
  cd "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0/resources"
  tar -zxvf "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0/resources/app.tar.gz"
  rm "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/1.4.0/resources/app.tar.gz"
  sudo mv $pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/cxstudy-wine.desktop /usr/share/applications/cxstudy-wine.desktop
  sudo chmod +x /usr/share/applications/cxstudy-wine.desktop
  sudo wine regedit "$pkgdir/usr/bin/lib/cxstudy-wine/1.4.0/share/fontreplace.reg"
  #wineboot -r
  #reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\electron.app.学习通 /f
}