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
pkgname=polyfill-bundler
pkgver=1.0.137
pkgrel=1
pkgdesc='Polyfill service.'
arch=(any)
url=https://tsickert.com/polyfill-bundler
license=(CC-BY-4.0)
depends=(docker)
# NOTE: Only the service file is needed, the image is pulled from the
# registry.
source=("https://github.com/thaibault/polyfill-bundler/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(ca37585eb69ccebbbe52ef6c8e84e3e8d7a8f80b5ae95b0bc7ac05221afdc8a5)
copy_to_aur=true

package() {
    cd "${srcdir}/polyfill-bundler-${pkgver}"
    install \
        -D \
        --mode 644 \
        systemd.service \
        "${pkgdir}/usr/lib/systemd/system/polyfill-bundler.service"
    # NOTE: Needed as the service's working directory.
    install -d "${pkgdir}/srv/http/polyfill-bundler"
}
