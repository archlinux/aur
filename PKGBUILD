# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
_cname=梦日记
pkgname=${_pkgname}-zh-cn
pkgver=0.10
pkgrel=4
pkgdesc="Surrealistic adventure game about exploring the dreams (Simplified chinese)"
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player')
makedepends=(7zip desktop-file-utils)
source=("http://yumenikki.info/${_pkgname}${pkgver}chs.rar"
https://cdn2.steamgriddb.com/icon/06409663226af2f3114485aa4e0a23b4/8/16x16.png
${pkgname}.sh)
sha256sums=('912af73da62b739a8ea4ebd0542ae46939e3ba61791f438dbe5ad1ef345ab24b'
            '9241bab9fbc7383fa0daac31ce4ddde40643742c5d013c90d12724eeb323d587'
            'b3a283f1e65ee9c99458df049743c4dc87f15e7ab51e9014d5de0a71ebaf9cdc')
noextract=( *.rar ) #unsupported rar by bsdtar
options=(!strip)
prepare() {
  7z -y x "${_pkgname}${pkgver}chs.rar"
}
package() {
  install -d "$pkgdir/opt"
  rm "${_cname}/Yumenikki${pkgver}/RPG_RT.exe"
  mv "${_cname}/Yumenikki${pkgver}/" "$pkgdir/opt/$pkgname"
  #What is the correct encoding for iconv?
  install -Dm644 "${_cname}/请先阅读。${pkgver}.txt" "$pkgdir/opt/$pkgname/ReadMe.txt"
  install -Dm644 "${_cname}/中文版补充说明.txt" "$pkgdir/opt/$pkgname/SupplementForChineseVer.txt"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 16x16.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 /usr/share/applications/easyrpg-player.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  desktop-file-edit "$pkgdir/usr/share/applications/${pkgname}.desktop" \
    --set-name=${_cname} --set-key=Exec --set-value=${pkgname} --set-icon=${pkgname} --set-comment='Explore the dreams'
}
