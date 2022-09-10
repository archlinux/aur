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

pkgname='google-compute-engine-oslogin'
pkgver=20220721.00
pkgrel=1
pkgdesc='OS Login Guest Environment for Google Compute Engine'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-oslogin'
license=('Apache')
depends=('curl' 'json-c' 'pam')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-oslogin/archive/$pkgver.tar.gz"
        'google-compute-engine-oslogin.install')
sha256sums=('17a0cd15df917c6ae29daa299d04e2e95e8b891918d2976b31b6c13398f0bc37'
            '3e488f66f6ddc5882d731bd951391efe588c1fbb19afcf4de5283ec7fd481039')
install='google-compute-engine-oslogin.install'

build() {
	cd "guest-oslogin-$pkgver"
	make
}

check() {
	cd "guest-oslogin-$pkgver"
	make GTEST_DIR=/usr/src/googletest non_network_tests
}

package() {
	cd "guest-oslogin-$pkgver"
	make VERSION="$pkgver" DESTDIR="$pkgdir/" SYSTEMDDIR=/usr/lib/systemd/system \
		PRESETDIR=/usr/lib/systemd/system-preset install
}
