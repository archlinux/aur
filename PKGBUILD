# Maintainer: lucas007 <lucaszhou007@163.com>
_pkggroupname="HBuilderX"
_pkgname="hbuilderx"
pkgname="hbuilderx-bin"
pkgver="4.85.2025110510"
pkgrel=1
epoch=1
provides=('HBuilderX')
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64' "aarch64" "loong64")
url="https://www.dcloud.io"
license=('unknown')
source=(
"https://download1.dcloud.net.cn/download/$_pkggroupname.$pkgver.linux_x64.full.tar.gz"
"${_pkgname}.service"
)
sha256sums=('ad63be64ed35c2df7efc6e6928b4c4890809f43d31f930d09d7e8657cd136692'
            'bb28130a8fde4f461a12573507bd6070ebadb5cc54c34a63afaea14764f8757f')
options=(!strip !debug)

package() {
      install -Dm 644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

      install -d "$pkgdir/opt/$_pkgname"
      cp -r "$srcdir/$_pkggroupname/"* "$pkgdir/opt/$_pkgname"
      # 创建符号链接以便在终端中直接使用cli命令
      install -d "$pkgdir/usr/bin"
      ln -s "/opt/$_pkgname/cli" "$pkgdir/usr/bin/hbuilderx-cli"
}

# makepkg -g
# updpkgsums
# makepkg -sf
# makepkg --printsrcinfo > .SRCINFO
