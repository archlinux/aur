# Copyright 2018 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Lorenzo Castelli <lcastelli@google.com>
# Maintainer: Samuel Littley <samuellittley@google.com>

pkgname='google-compute-engine'
pkgver=20210113.00
pkgrel=1
pkgdesc='Linux Guest Environment for Google Compute Engine'
arch=('any')
url='https://github.com/GoogleCloudPlatform/guest-configs'
license=('Apache')
depends=('google-compute-engine-oslogin' 'google-guest-agent')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-configs/archive/$pkgver.tar.gz"
        'google-compute-engine.install')
sha256sums=('4d30fcfa368507f219ecf7e884442e5b556fbaec3f3367dc5c8b116f63be2977'
            '9b31cc5146d83374cc8f8da9f0ce924bbafeb932d0cf0ce60e4aec71d1f981b7')
install='google-compute-engine.install'

package() {
	cd "guest-configs-$pkgver"
	install -m644 -Dt "$pkgdir/etc/modprobe.d" src/etc/modprobe.d/*
	install -m644 -Dt "$pkgdir/etc/sysctl.d" src/etc/sysctl.d/*
	install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" src/lib/udev/rules.d/*
	install -m755 -Dt "$pkgdir/usr/bin" src/usr/bin/*
	ln -s /usr/bin/google_set_hostname "$pkgdir/etc/dhclient-exit-hooks"
}
