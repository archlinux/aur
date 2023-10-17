# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="x-resize"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A manual implementation of auto resizing for non-GNOME environments (like XFCE) running under Spice/Libvirt"
arch=("any")
url="https://gist.github.com/IngoMeyer441/84cf1e40fa756a9c3e6c8d9e38ee9b6f"
license=("MIT")
depends=("qemu-guest-agent" "spice-vdagent" "xorg-xrandr")
makedepends=()
source=("https://gist.githubusercontent.com/IngoMeyer441/84cf1e40fa756a9c3e6c8d9e38ee9b6f/raw/580c836aab54e84360dd3f9fc94808b23cc74ac3/x-resize")
sha256sums=("ee4815fda73aace38735407098b1dec8b719c5ac56404bf179eefec2bf52f37b")

package() {
    cd "${srcdir}" || return
    install -Dm755 -t "${pkgdir}/usr/bin/" x-resize && \
    install -d "${pkgdir}/etc/udev/rules.d" "${pkgdir}/var/log/autores" && \
    cat <<-'EOF' > "${pkgdir}/etc/udev/rules.d/50-x-resize.rules" || return
		ACTION=="change", KERNEL=="card[0-9]*", SUBSYSTEM=="drm", RUN+="/usr/bin/x-resize"
	EOF
}
