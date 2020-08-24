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
pkgver=20200819.00
pkgrel=1
pkgdesc='OS Login Guest Environment for Google Compute Engine'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-oslogin'
license=('Apache')
depends=('curl' 'json-c' 'pam')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-oslogin/archive/$pkgver.tar.gz"
        'google-compute-engine-oslogin.install')
sha256sums=('11be57b2573dea6ca2f823256db9e78c2a8fbfebd0136dd974a8536ff09ac303'
            'b7d7d409a22602967c110ed80293223f904737e3683b0b7cd07fe94a2c52fb8d')
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
