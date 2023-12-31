# Maintainer yueduz <yueduz at gmail dot com>
pkgname=zw3d-bin
pkgver=2024.0.3.0
pkgrel=1
pkgdesc="Parametric 3D modelling"
arch=('x86_64')
license=(custom)
makedepends=()
depends=()
provides=(zw3d)
#请手动从 https://www.zwsoft.cn/product/zw3d/linux 下载deb包到 Downloads 目录,版本请选择"银河麒麟V10 SP1/中科方德5.0/Ubuntu18.04及以上	x86_64/兆芯/海光"
source=("file:///home/$USER/Downloads/zw3d_${pkgver}_chs_eng_amd64.deb")
url="https://www.zwsoft.cn/product/zw3d/linux"
sha256sums=('cb65208e92250e325096a0900583cd02e801774df17f3500055963c3e58cf006')
  prepare(){
  mkdir -p "${srcdir}/zw3d2024"
  cd $srcdir
  bsdtar -zxf data.tar.xz -C "${srcdir}/zw3d2024"
}
 
package() {
  mv "${srcdir}/zw3d2024/opt/apps/zw3d2024/files/lib3rd/llibtiff.so.5" "${srcdir}/zw3d2024/opt/apps/zw3d2024/files/lib3rd/libtiff.so.5" #修复官方错误
  rm  ${srcdir}/zw3d2024/opt/apps/zw3d2024/files/lib3rd/libfreetype.s* #删除自带libfreetype库使用系统库
	mkdir -p $pkgdir/opt/apps/zw3d2024
  cp -r  ${srcdir}/zw3d2024/* "$pkgdir"
}
