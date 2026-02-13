# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=steamcommunity302
pkgver=14.0.02
pkgdate=2026/02
pkgrel=3
#epoch=
pkgdesc="羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动"
url="https://www.dogfight360.com/blog/18682/"
arch=('x86_64' 'aarch64')
license=('CC-BY-NC-4.0')
optdepends=(
  'zenity: Graphical password input for verifying administrator privileges.' 
  'kdialog: Graphical password input for verifying administrator privileges.'
  'iptables: Netfilter implementation for DNS redirection.'
  'nftables: Netfilter implementation for DNS redirection.'
  'firewalld: Netfilter implementation for DNS redirection.'
  'ufw: Netfilter implementation for DNS redirection.'
)
depends=('nss' 'libnetfilter_queue' 'gtk3' 'glibc' 'gcc-libs' 'zlib' 'sudo' 'xorg-xhost' )
source_x86_64=(
  "https://www.dogfight360.com/blog/wp-content/uploads/${pkgdate}/steamcommunity_302_Linux_AMD64_V${pkgver}.tar.gz"
  "302_icon.ico"
  "s302"
  "Steamcommunity_302.desktop"
)
source_aarch64=(
  "https://www.dogfight360.com/blog/wp-content/uploads/${pkgdate}/steamcommunity_302_Linux_ARM64_V${pkgver}.tar.gz"
  "302_icon.ico"
  "s302"
  "Steamcommunity_302.desktop"
)
md5sums_x86_64=(
  '4b9994102b2256ca5fdf2e806a2c7035'
  'SKIP'
  'SKIP'
  'SKIP'
)
md5sums_aarch64=(
  '6b19edfc3a24c1b43024bb569da9cf5e'
  'SKIP'
  'SKIP'
  'SKIP'
  )
options=(!strip)
# backup=(
#   opt/steamcommunity302/S302.ini
#   opt/steamcommunity302/steamcommunity.key
#   opt/steamcommunity302/steamcommunity.crt
#   opt/steamcommunity302/steamcommunity.csr
#   opt/steamcommunity302/steamcommunityCA.pem
#   opt/steamcommunity302/steamcommunityCA.key
#   opt/steamcommunity302/steamcommunityCA.crl
# )
package() {
  # 1. 安装主程序文件到 /opt/steamcommunity302
  install -d "${pkgdir}/opt/steamcommunity302"
  cp -a "${srcdir}/Steamcommunity_302"/* "${pkgdir}/opt/steamcommunity302/"
  
  # 设置可执行权限
  chmod 755 "${pkgdir}/opt/steamcommunity302"/{Steamcommunity_302,steamcommunity_302.cli,steamcommunity_302.caddy}

  # 2. 安装图标到 /usr/share/pixmaps
  install -Dm644 "302_icon.ico" "${pkgdir}/usr/share/pixmaps/steamcommunity302.ico"

  # 3. 安装启动器脚本到 /usr/bin
  install -Dm755 "s302" "${pkgdir}/usr/bin/s302"

  # 4. 安装 .desktop 文件到系统应用目录
  install -Dm644 "Steamcommunity_302.desktop" "${pkgdir}/usr/share/applications/steamcommunity302.desktop"

}
