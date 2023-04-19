# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="py-mailqueued-mta"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="Uses py-mailqueued as an MTA for msmtp"
arch=("any")
license=("MIT")
depends=("msmtp" "py-mailqueued")
conflicts=("smtp-forwarder")
provides=("smtp-forwarder")

package() {
    cd "${pkgdir}" || return
    mkdir -p "usr/bin" && \
    cat <<-EOF >"usr/bin/sendmail" || return
		#!/bin/sh

		/usr/bin/mail-queue /usr/bin/msmtp "\$@"
	EOF
    chmod +x "usr/bin/sendmail"
}
