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
pkgver=1.0.139
pkgrel=1
pkgdesc='Polyfill service.'
arch=(any)
url=https://tsickert.com/polyfill-bundler
license=(CC-BY-4.0)
depends=(docker)
# NOTE: Only the service file is needed, the image is pulled from the
# registry.
source=("https://github.com/thaibault/polyfill-bundler/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('187fdd008e7455b59cfedd70d9e8c88825957cec466b07f237df7364d15e3a6d')
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
