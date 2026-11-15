#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]tsickert.com) 07.11.2026

# License
# -------

# This library written by Torben Sickert stands under a creative commons naming
# 4.0 international license.
# See https://creativecommons.org/licenses/by/4.0/deed.de
# endregion
pkgname=gocryptfs-standalone
pkgver=0.0.4
pkgrel=1
pkgdesc='Synchronizes a gocryptfs (plaintext names) encrypted directory with a decrypted copy without needing FUSE or admin rights.'
arch=(any)
url=https://tsickert.com/gocryptfs-standalone
license=(CC-BY-4.0)
depends=('nodejs>=26')
optdepends=(
    'libsecret: to store passwords of configured pairs in the keychain'
)
# NOTE: The published package contains the bundled command line interface.
source=("https://registry.npmjs.org/gocryptfs-standalone/-/gocryptfs-standalone-${pkgver}.tgz")
sha256sums=(5611f0582f983469925a28f79bbd0c75c6acb2f5f381f0cdae90014591afb697)
copy_to_aur=true

package() {
    cd "${srcdir}/package"
    install \
        -D \
        --mode 755 \
        dist/index.js \
        "${pkgdir}/usr/lib/gocryptfs-standalone/dist/index.js"
    install \
        -D \
        --mode 644 \
        package.json \
        "${pkgdir}/usr/lib/gocryptfs-standalone/package.json"
    install \
        -D \
        --mode 644 \
        readme.md \
        "${pkgdir}/usr/share/doc/gocryptfs-standalone/readme.md"
    install -d "${pkgdir}/usr/bin"
    ln \
        --symbolic \
        /usr/lib/gocryptfs-standalone/dist/index.js \
        "${pkgdir}/usr/bin/gocryptfs-standalone"
}
