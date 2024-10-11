# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="x-resize"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="A manual implementation of auto resizing for non-GNOME environments (like XFCE) running under Spice/Libvirt"
arch=("any")
url="https://gist.github.com/IngoMeyer441/84cf1e40fa756a9c3e6c8d9e38ee9b6f"
license=("MIT")
depends=("qemu-guest-agent" "spice-vdagent" "xorg-xrandr")
makedepends=()
source=("https://gist.githubusercontent.com/IngoMeyer441/84cf1e40fa756a9c3e6c8d9e38ee9b6f/raw/1ece868e5954bf6a8ce169d532f45e4c0114a477/x-resize")
sha256sums=("a19aa3f849f4a6db6577becdf5bd52ca735590404e1cb071029129c2fcbd60ac")

package() {
    cd "${srcdir}" || return
    install -Dm755 -t "${pkgdir}/usr/bin/" x-resize && \
    install -d "${pkgdir}/etc/udev/rules.d" "${pkgdir}/var/log/autores" && \
    cat <<-'EOF' > "${pkgdir}/etc/udev/rules.d/50-x-resize.rules" || return
		ACTION=="change", KERNEL=="card[0-9]*", SUBSYSTEM=="drm", RUN+="/usr/bin/x-resize"
	EOF
}
