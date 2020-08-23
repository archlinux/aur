# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.4.1
pkgrel=2
epoch=
pkgdesc="ROM package for CraftOS-PC"
arch=('any')
url="https://github.com/MCJack123/craftos2-rom"
license=('CCPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MCJack123/craftos2-rom/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('301355e8183e2ff6538ca97585aff952f6b52495c4121f1d974cf88ed668fba5')
validpgpkeys=()

prepare() {
    cd "craftos2-rom-$pkgver"
    # REMOVE AFTER v2.4.1!
    patch <<EOF
diff --git a/bios.lua b/bios.lua
index 8d23193..756209b 100644
--- a/bios.lua
+++ b/bios.lua
@@ -237,6 +237,7 @@ end]]
 if jit then
     local nativeError = error
     _G.error = function(msg, level) if level and level < 0 then return nativeError(msg) else return nativeError(msg, level) end end
+    io.read = function(...) if io.input() == io.stdin then return read() else return io.input():read(...) end end
 end

 -- Install lua parts of the os api
EOF
}

build() {
	true
}

check() {
    true
}

package() {
    mkdir -p "$pkgdir/usr/share/craftos"
	cp -R craftos2-rom-$pkgver/* "$pkgdir/usr/share/craftos/"
}
