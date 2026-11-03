# Maintainer: lzsnyy <710080675@qq.com>

pkgname=workbuddy-agent
_pkgver=5.6.2.40046327
_build=c7b525f3
pkgver=${_pkgver}_${_build}
pkgrel=1
pkgdesc="腾讯云代码助手推出的 AI Agent 办公工具"
arch=('x86_64' 'aarch64')
url="https://www.workbuddy.cn/app"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
         'libxkbcommon' 'libxrandr' 'mesa' 'libsecret' 'libappindicator'
         'libpulse' 'libnotify' 'json-glib' 'wayland' 'systemd-libs' 'dbus')
optdepends=(
	'python-pip'
	'nodejs-lts: frontend skills'
	'imagemagick'
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=('workbuddy')
_registry="https://registry.npmjs.org"
source=(
  WorkBuddy.desktop
  "${_registry}/better-sqlite3/-/better-sqlite3-13.0.3.tgz"
)
sha256sums=('c093969b3d9b3a1828af23728144185ada452baaf706020aa179d5f4d5dd6b8c'
            '77e0513dc1a469fb3bceec4c7fb5ad3f403109787eda05be047ec17fd56868cb')
source_x86_64=("WorkBuddy-linux-x64-deb-${_pkgver}-${_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${_pkgver}-${_build}.deb")
source_aarch64=("WorkBuddy-linux-arm64-deb-${_pkgver}-${_build}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${_pkgver}-${_build}.deb")
sha256sums_x86_64=('12149ad8c0cd748fd5062d8f62c7827d688d8095427ada99b1ae9e7019897523')
sha256sums_aarch64=('561822578435d382a06d0a0b079a4b157f68b588c9fe72d589e2a88b2fd155fa')

options=(!strip !debug)

prepare() {
    tar xf data.tar.xz
}

package() {
    install -d ${pkgdir}/opt/WorkBuddy
    cp -a usr ${pkgdir}/
    install -m644 WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd opt/WorkBuddy
    cp -a * ${pkgdir}/opt/WorkBuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec /opt/WorkBuddy/workbuddy "\$@"
EOF
}
