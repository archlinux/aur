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
pkgver=20200325.00
pkgrel=1
pkgdesc='Google Compute Engine OS login support'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-oslogin'
license=('Apache')
depends=('curl' 'json-c' 'pam')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-oslogin/archive/$pkgver.tar.gz")
sha256sums=('6291198dad14bcad4c3e34a52acf3a5631ed005e7366e0eb5f4069a59afe82a2')

build() {
	cd "guest-oslogin-$pkgver"
	make
}

package() {
	cd "guest-oslogin-$pkgver"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/lib/systemd"
	mv "$pkgdir"/{,usr/}lib/systemd/system
	rm -r "$pkgdir/lib"
}
