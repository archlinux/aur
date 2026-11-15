#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]tsickert.com) 14.11.2026

# License
# -------

# This library written by Torben Sickert stands under a creative commons naming
# 4.0 international license.
# See https://creativecommons.org/licenses/by/4.0/deed.de
# endregion
pkgname=reverse-proxy-middleware
pkgver=0.0.148
pkgrel=1
pkgdesc='A reverse proxy blocking bot requests.'
arch=(any)
url=https://tsickert.com/reverse-proxy-middleware
license=(CC-BY-4.0)
depends=(docker)
backup=(srv/http/reverse-proxy-middleware/configuration.json)
# NOTE: Only the service file is needed, the image is pulled from the
# registry.
source=("https://github.com/thaibault/reverse-proxy-middleware/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b0a2704310098499157518c4812a8b3f854fe995b4e68d13cf84388c64e688b')
copy_to_aur=true

package() {
    cd "${srcdir}/reverse-proxy-middleware-${pkgver}"
    install \
        -D \
        --mode 644 \
        systemd.service \
        "${pkgdir}/usr/lib/systemd/system/reverse-proxy-middleware.service"
    # NOTE: The service mounts this file into the container. Docker would
    # create a directory instead if it does not exist.
    install -d "${pkgdir}/srv/http/reverse-proxy-middleware"
    echo '{}' > "${pkgdir}/srv/http/reverse-proxy-middleware/configuration.json"
    chmod 644 "${pkgdir}/srv/http/reverse-proxy-middleware/configuration.json"
}
