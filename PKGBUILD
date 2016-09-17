#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=backup-rotation
pkgver=VERSION
pkgrel=10
pkgdesc='This script allows you to create a local or remote backup rotation for your files.'
arch=('any')
url='http://torben.website/backupRotation'
license=('CC-BY-3.0')
depends=('bash' 'rsync' 'findutils')
optdepends=('msmtp: for automatic email notifications on missing sources')
provides=(backup-rotation)
source=('https://raw.githubusercontent.com/thaibault/backupRotation/master/backupRotation.sh' \
        'https://raw.githubusercontent.com/thaibault/backupRotation/master/backupRotation.timer' \
        'https://raw.githubusercontent.com/thaibault/backupRotation/master/backupRotation.service')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd backupRotation
    echo "1.0.r$(git rev-list --count HEAD)$(git rev-parse --short HEAD)"
}

package() {
    install -D --mode 755 "${srcdir}/backupRotation.sh" \
        "${pkgdir}/usr/bin/backup-rotation"
    install -D --mode 755 "${srcdir}/backupRotation.service" \
        "${pkgdir}/etc/systemd/system/backup-rotation.service"
    install -D --mode 755 "${srcdir}/backupRotation.timer" \
        "${pkgdir}/etc/systemd/system/backup-rotation.timer"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
