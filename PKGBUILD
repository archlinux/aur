#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]tsickert.com) 16.12.2012

# License
# -------

# This library written by Torben Sickert stands under a creative commons naming
# 4.0 international license.
# See https://creativecommons.org/licenses/by/4.0/deed.de
# endregion
pkgname=bashlink
pkgver=2.0.0
pkgrel=1
pkgdesc='A high reliable bash library.'
arch=(any)
url=https://tsickert.com/bashlink
license=(CC-BY-4.0)
devdepends=(shellcheck)
depends=(bash coreutils diffutils grep sed)
optdepends=(
    'pv: for advanced filesystem operations and process visualization'
)
provides=(bashlink bashlink-doctest bashlink-document)
# NOTE: The published package keeps the folder structure (e.g. "prompt/").
source=("https://registry.npmjs.org/bashlink/-/bashlink-${pkgver}.tgz")
sha256sums=('31da177290214c089c340f958fdf14c52babc413579a7f391e9fcfc9f382c2b8')
copy_to_aur=true

package() {
    cd "${srcdir}/package"
    local file_path
    # NOTE: Keep the published modes since some modules are executables.
    for file_path in *.sh prompt/*.sh; do
        install \
            -D \
            --mode "$(stat --format %a "$file_path")" \
            "$file_path" \
            "${pkgdir}/usr/lib/bashlink/${file_path}"
    done
    install -d "${pkgdir}/usr/bin"
    ln \
        --symbolic \
        /usr/lib/bashlink/doctest.sh \
        "${pkgdir}/usr/bin/bashlink-doctest"
    ln \
        --symbolic \
        /usr/lib/bashlink/documentation.sh \
        "${pkgdir}/usr/bin/bashlink-document"
}
