# Maintainer yueduz <yueduz at gmail dot com>
pkgname=zw3d-bin
pkgver=2025.0.3.0
pkgrel=4
pkgdesc="Parametric 3D modelling"
arch=('x86_64')
license=(custom)
makedepends=()
depends=('libjpeg6-turbo' 'noto-fonts-cjk' 'libwebp')
provides=(zw3d)
#请手动从 https://www.zwsoft.cn/product/zw3d/linux 下载deb包到 Downloads 目录,版本请选择"深度V20 x86"
source=("file:///home/$USER/Downloads/signed_com.zwsoft.zw3d2025_${pkgver}_amd64.deb" )
url="https://www.zwsoft.cn/product/zw3d/linux"
sha256sums=('a2a7e78b455b5876f24ec6fa1abeac8c0c73bff00a2416a1a49ed45ad582ba6d')
  prepare(){
  mkdir -p "${srcdir}/${pkgname}"
  cd $srcdir
  bsdtar -zxf data.tar.xz -C "${srcdir}/${pkgname}"
  chmod -R 755  "${srcdir}/${pkgname}"
}
 
package() {
  #删除自带libfreetype库，使用系统库
  rm  ${srcdir}/${pkgname}/opt/apps/com.zwsoft.zw3d2025/files/lib3rd/libfreetype.* 
  #archlinux 当前提供的是 /usr/lib/libwebp.so.7
  rm ${srcdir}/${pkgname}/opt/apps/com.zwsoft.zw3d2025/files/lib3rd/libwebp.so.6  
  ln -s /usr/lib/libwebp.so ${srcdir}/${pkgname}/opt/apps/com.zwsoft.zw3d2025/files/lib3rd/libwebp.so.6  
  #zw3d使用绝对路径加载该字体
  mkdir -p ${srcdir}/${pkgname}/usr/share/fonts/opentype/noto/
  ln -s /usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc ${srcdir}/${pkgname}/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc  
  cp -r  ${srcdir}/${pkgname}/* "$pkgdir"
}
