# Maintainer: Ruben Kharel <talkto@rubenk.com.np>

pkgname=chatgpt-desktop-git
_pkgnamegit=ChatGPT
pkgver=v0.10.3.r1.gc293f07
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=('x86_64')
url="https://github.com/lencx/ChatGPT"
license=("Apache")

provides=("chatgpt-desktop")
conflitct=("chatgpt-desktop")


makedepends=("rustup" "git")
depends=("openssl-1.1" "webkit2gtk")
md5sums=("SKIP")

source=("git+${url}")

pkgver() {
	cd "${_pkgnamegit}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgnamegit}"
	mkdir -p "dist"
	cargo build --release
}

package() {
	cd "${_pkgnamegit}"
	install -Dm755 ./target/release/chatgpt "${pkgdir}/usr/bin/chatgpt"
	cd ${pkgdir}/../../
	install -Dm644 chat-gpt.desktop "${pkgdir}/usr/share/applications/chat-gpt.desktop"
	install -Dm644 128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/chat-gpt.png"
	install -Dm644 256.png "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/chat-gpt.png"
	install -Dm644 32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/chat-gpt.png"
	install -Dm644 256.png "${pkgdir}/usr/share/pixmaps/chat-gpt.png"
}








